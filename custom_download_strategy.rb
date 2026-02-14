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
    curl_download download_url, to: temporary_path
  end

  def download_url
    "https://#{@github_token}@github.com/#{@owner}/#{@repo}/releases/download/#{@tag}/#{@filename}"
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
