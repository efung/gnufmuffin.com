module Jekyll

  class YearArchiveGenerator < Generator
    safe true
    def generate(site)
      if site.layouts.key? 'year_archive_index'
        site.posts.docs.group_by{ |c| c.date.year }.each do |year, posts|
          posts = posts.sort_by { |p| -p.date.to_f }
          archive_dir = year.to_s
          paginate(site, archive_dir, posts, year)
        end
      end
    end

    def paginate(site, dir, posts, year)
      pager = Jekyll::Paginate::Pager.new(site, 1, posts, 1)
      archive_path = "/" + dir
      path = archive_path

      newpage = YearArchiveIndex.new(site, site.source, path, archive_path, year, posts)
      newpage.pager = pager
      site.pages << newpage
    end
  end

  class YearArchiveIndex < Page
    def initialize(site, base, dir, base_path, year, posts)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'year_archive_index.html')
      self.data['title'] = "#{year} Archive"
      self.data['base'] = base_path
    end
  end
end
