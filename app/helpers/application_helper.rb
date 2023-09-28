module ApplicationHelper
    def flash_classname(message_type)
      case message_type.to_sym
      when 'notice' then 'bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative'
      when 'alert' then 'bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative'
      else 'bg-blue-100 border border-blue-400 text-blue-700 px-4 py-3 rounded relative'
      end
    end

    def default_meta_tags
      {
        site: 'Spice Gate',
        reverse: true,
        charset: 'utf-8',
        description: 'スパイスカレーに愛を込めて',
        keywords: 'スパイス, カレー, スパイスカレー',
        canonical: request.original_url,
        separator: '|',
        icon: [
          { href: image_url('ogp.png'),
            sizes: '180x180',
            type: 'image/png' },
        ],
        og: {
          site_name: :site,
          title: 'Spice Gate'
          description: :description,
          type: 'website',
          url: request.original_url,
          image: image_url('ogp.png'),
          locale: 'ja_JP',
        },
        twitter: {
          card: 'summary_large_image',
          image: image_url('ogp.png', host: 'https://spice-gate-a5b0ea4c3952.herokuapp.com')
        }
      }
    end

end
