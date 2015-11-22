namespace :members do
  desc "create_or_update"
  task :create_or_update => :environment do |t, args|
    api = Api::Idfy.new
    page = 0
    while true
      page += 1
      result = api.list_member(page: page)
      members = result["members"]
      break if members.nil?
      members.each do |member_hash|
        Member.create_or_update(member_hash)
      end
      Rails.logger.info { "processed page #{page}" }
    end
  end
end