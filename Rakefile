require 'jekyll'
require 'tmpdir'
require 'stringex'

source_dir      = "."         # source file directory
deploy_dir      = "_site"     # deploy directory (for Github pages deployment)
stash_dir       = "_stash"    # directory to stash posts for speedy generation
posts_dir       = "_posts"    # directory for blog files
new_post_ext    = "md"        # default new page file extension when using the new_page task



# Usage:
# bundle exec rake site:<task>
namespace :site do
  desc "Generate site"
  task :generate do
    puts "## Generating Site with Jekyll"
    Jekyll::Site.new(Jekyll.configuration({
      "source"      => ".",
      "destination" => "_site",
      "config" => "_config.yml"
    })).process
  end

  desc "Publish blog to gh-pages"
  task :publish => [:generate] do
    # Compile the Jekyll site using the config.
    # Get the origin to which we are going to push the site.
    origin = `git config --get remote.origin.url`

    # Make a temporary directory for the build before production release.
    # This will be torn down once the task is complete.
    Dir.mktmpdir do |tmp|
      # Copy accross our compiled _site directory.
      cp_r "_site/.", tmp

      # Switch in to the tmp dir.
      Dir.chdir tmp

      # Prepare all the content in the repo for deployment.
      system "git init" # Init the repo.
      system "git add . && git commit -m 'Site updated at #{Time.now.utc}'" # Add and commit all the files.

      # Add the origin remote for the parent repo to the tmp folder.
      system "git remote add origin #{origin}"

      # Push the files to the gh-pages branch, forcing an overwrite.
      system "git push origin master:refs/heads/gh-pages --force"
    end

    # Done.
  end

  desc "Begin a new post in #{source_dir}/#{posts_dir}"
  task :post, :title do |t, args|
    title = ENV["title"] || get_stdin("Enter a title for your post: ")
    mkdir_p "#{source_dir}/#{posts_dir}"

    date = (ENV["date"] ? Time.parse(ENV["date"]) : Time.now)
    dateYmd = date.strftime('%Y-%m-%d')

    filename = "#{dateYmd}-#{title.to_url}.#{new_post_ext}"
    pathname = "#{source_dir}/#{posts_dir}/#{filename}"
    if File.exist?(pathname)
      abort("rake aborted!") if ask("#{pathname} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
    end
    puts "Creating new post: #{pathname}"
    open(pathname, 'w') do |post|
      post.puts "---"
      post.puts "layout: post"
      post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
      post.puts "date: #{dateYmd} #{Time.now.strftime('%H:%M:%S %z')}"
      post.puts "comments: true"
      post.puts "permalink: /#{date.strftime('%Y/%m')}/#{title.to_url}.html"
      post.puts "tags: []"
      post.puts "thumbnail: "
      post.puts "---"
    end
  end

end

def get_stdin(message)
    print message
    STDIN.gets.chomp
end
