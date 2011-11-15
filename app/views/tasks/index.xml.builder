xml.instruct! :xml, :version => '1.0', :encoding => 'utf-8'
xml.tasks do
  @current_tasks.each do |task|
    xml.task do
      xml.title task.name
      xml.labelname task.folder.name
      xml.due task.due
      xml.created_at task.created_at
    end
  end
end