require "download_strategy"

class GitHubPrivateRepositoryReleaseDownloadStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    super
    parse_url_pattern
    set_github_token
  end

  def parse_url_pattern
    url_pattern = %r{https://github.com/([^/]+)/([^/]+)/releases/download/([^/]+)/(\S+)}
    unless @url =~ url_pattern
      raise CurlDownloadStrategyError, "Invalid GitHub release URL pattern"
    end

    _, @owner, @repo, @tag, @filename = *@url.match(url_pattern)
  end

  private

  def _fetch(url:, resolved_url:, timeout:)
    # Use GitHub API to get the asset's download URL, then download with auth headers
    api_url = "https://api.github.com/repos/#{@owner}/#{@repo}/releases/tags/#{@tag}"
    assets_json = Utils.popen_read(
      "curl", "-fsSL",
      "-H", "Authorization: token #{@github_token}",
      "-H", "Accept: application/vnd.github+json",
      api_url
    )

    require "json"
    release = JSON.parse(assets_json)
    asset = release.fetch("assets").find { |a| a["name"] == @filename }
    raise CurlDownloadStrategyError, "Asset #{@filename} not found in release #{@tag}" unless asset

    asset_url = asset.fetch("url")

    curl_download(
      asset_url,
      "--header", "Authorization: token #{@github_token}",
      "--header", "Accept: application/octet-stream",
      to: temporary_path
    )
  end

  def set_github_token
    @github_token = ENV["HOMEBREW_GITHUB_API_TOKEN"]
    unless @github_token
      raise CurlDownloadStrategyError,
            "HOMEBREW_GITHUB_API_TOKEN is required. Set it with: " \
            "export HOMEBREW_GITHUB_API_TOKEN=$(gh auth token)"
    end
  end
end
