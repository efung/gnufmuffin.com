module Jekyll

  class IndexGenerator < Generator
    safe true
    def generate(site)
      if site.layouts.key? 'month_archive_index'
        @months_with_posts = site.posts.group_by{ |c| "#{c.date.year}/#{"%02d" % c.date.month}" }.keys.sort

        site.posts.group_by{ |c| {"month" => c.date.month, "year" => c.date.year} }.first(1) do |period, posts|
          posts = posts.sort_by { |p| -p.date.to_f }
          archive_dir = ''
          paginate(site, archive_dir, posts, period["year"], period["month"])
        end
      end
    end

    def paginate(site, dir, posts, year, month)
      pager = Pager.new(site, 1, posts, 1)
      archive_path = "/" + dir
      path = archive_path

      this_month = @months_with_posts.index(dir.to_s)
      prev_month = ("/" + @months_with_posts[this_month-1] + "/") if this_month > 0
      next_month = ("/" + @months_with_posts[this_month+1] + "/") if this_month < @months_with_posts.length-1

      newpage = Index.new(site, site.source, path, archive_path, year, month, posts, next_month, prev_month)
      newpage.pager = pager
      site.pages << newpage
    end
  end

  class Index < Page
    def initialize(site, base, dir, base_path, year, month, posts, next_month, prev_month)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'month_archive_index.html')
      self.data['title'] = "Do You Know the Muffin Man?"
      self.data['base'] = base_path
      self.data['next'] = next_month
      self.data['prev'] = prev_month
    end
  end
end
