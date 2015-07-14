module PostsHelper

	def wrap(content)
    sanitize(raw(content.split.map{ |s| wrap_long_string(s) }.join(' ')))
  end

  private

    def wrap_long_string(text, max_width = 40)
      zero_width_space = "&#8203;"
      regex = /.{1,#{max_width}}/
      (text.length < max_width) ? text :
                                  text.scan(regex).join(zero_width_space)
    end

    def truncate(text, options = {})
        options.reverse_merge!(:length => 30)
        text.truncate(options.delete(:length), options) if text
    end
end
