module ProfileHelper

  def social_media_button provider
    if social_media.has_key? provider.downcase.to_sym
      button_tag("Add #{provider}")
    end
  end

  def social_media
    {
      :twitch => ""
    }
  end
end
