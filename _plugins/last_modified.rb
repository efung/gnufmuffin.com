module LastModified
  class Generator < Jekyll::Generator
    priority :highest
    def generate(site)
        @site = site
        @site.pages.each do |page|
            set_last_modified_date(page)
        end
        @site.posts.docs.each do |post|
            set_last_modified_date(post)
        end
    end

    def source(post_or_page)
        post_or_page.path
    end

    def set_last_modified_date(post_or_page)
        entity_source = source(post_or_page)
        last_modified = `git log -1 --format="%ad" -- "#{entity_source}"`
        last_modified.strip!
        post_or_page.data["last_modified_at"] = last_modified
    end
  end
end
