json.extract! contact, :id, :contact_name, :contact_phone_number, :user_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
