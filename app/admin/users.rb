ActiveAdmin.register User do
  ActiveAdmin.register User do
    index do
      selectable_column
      column :username
      column :phone
      column :address
      column :encrypted_password
      actions
    end
  end
  
end
