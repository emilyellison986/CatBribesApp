module MemberHelper
  def gravatar_for(member, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(member.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: member.full_name, class: "gravatar")
  end
end