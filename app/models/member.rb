class Member < ActiveRecord::Base
  def self.create_from_api(member_hash)
    Member.create(
      id_api: member_hash["id"],
      dob: Date.parse(member_hash["dob"]),
      status: member_hash["status"],
      ethnicity: member_hash["ethnicity"],
      weight: member_hash["weight"],
      height: member_hash["height"],
      is_veg: member_hash["is_veg"].to_bool,
      drink: member_hash["drink"].to_bool,
      image: member_hash["image"]
    )
  end

  def update_from_api(member_hash)
    update_attributes!(
      # ignore id_api
      dob: Date.parse(member_hash["dob"]),
      status: member_hash["status"],
      ethnicity: member_hash["ethnicity"],
      weight: member_hash["weight"],
      height: member_hash["height"],
      is_veg: member_hash["is_veg"].to_bool,
      drink: member_hash["drink"].to_bool,
      image: member_hash["image"]
    )
  end

  def self.create_or_update(member_hash)
    id_api = member_hash["id"]
    member = Member.where(id_api: id_api).first
    if member
      member.update_from_api(member_hash)
      Rails.logger.debug { "updated ##{member_hash}"}
    else
      create_from_api(member_hash)
      Rails.logger.debug { "created ##{member_hash}"}
    end
  end
end