module ProfileHelper
  def unverified_social_media_button(provider)
    if SocialMediaAccount.all_providers.include? provider
      link_to "Add #{provider}",
              social_media_link(provider),
              class: "btn btn-default social_media_account \
              #{provider} unverified"
    end
  end

  def verified_social_media_button(account)
    link_to "#{account.provider}: #{account.username}",
            account.url,
            target: '_blank',
            class: "btn btn-default social_media_account \
            #{account.provider} verified"
  end

  def social_media_link(provider)
    "/auth/#{provider}"
  end
end
