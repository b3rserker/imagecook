json.array!(@distros) do |distro|
  json.extract! distro, :id, :name, :info, :valid
  json.url distro_url(distro, format: :json)
end
