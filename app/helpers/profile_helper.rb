module ProfileHelper

  def social_media_button provider
    if social_media.has_key? provider
      link_to "Add #{provider}", "/auth/#{provider}"#auth_account_path(provider)
    end
  end

  def verified_social_media_button account
    # button
    # text: account.username
    # link: account.url
    # class: account.provider
    button_tag(account.username)
  end

  def social_media
    {
      :twitch => ""
    }
  end
end
