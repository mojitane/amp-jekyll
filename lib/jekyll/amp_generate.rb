module Jekyll
  # Defines the base class of AMP posts
  class AmpPost < Jekyll::Page
    def initialize(site, base, dir, post)

    end
  end
  # Generates a new AMP post for each existing post
  class AmpGenerator < Generator
    priority :low
    def generate(site)
      dir = site.config['ampdir'] || 'amp'
      site.posts.docs.each do |post|
        next if post.data['skip_amp'] == true
        site.pages << AmpPost.new(site, site.source, File.join(dir, post.id), post)
      end
    end
  end
end
