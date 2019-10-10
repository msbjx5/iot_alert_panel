class Grafana
  def self.create(mac)
    model = File.read(Rails.root.join('grafana/model.json'))
    model = model.gsub('xxxxxxxxxxxx', mac)
    path = File.join(Rails.root, 'grafana', 'dashboards')
    File.open(File.join(path, "#{mac}.json"), 'wb') do |f|
      f.write(model)
    end
  end

  def self.update(old_mac, new_mac)
    path = File.join(Rails.root, 'grafana', 'dashboards', "#{old_mac}.json")
    file = File.read(path)
    file = file.gsub(old_mac, new_mac)
    File.open(File.join(path), 'r+') do |f|
      f.write(file)
    end
    new_path = File.join(Rails.root, 'grafana', 'dashboards')
    system("mv #{path} #{new_path}/#{new_mac}.json")
  end
end
