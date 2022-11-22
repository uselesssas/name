class ChangePhoneNumberToUsers < ActiveRecord::Migration[6.1]
  def up
    User.find_each do |u|
      if u.phone_number.nil?
        u.update(phone_number: '11111111111')
      else
        u.update(phone_number: u.phone_number.slice(0..14))
      end
    end

    change_column :users, :phone_number, :string, limit: 15, default: '11111111111', null: false
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
