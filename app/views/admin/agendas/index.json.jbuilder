json.array!(@agendas) do |agenda|
  json.extract! agenda, :id, :title, :content, :startdate, :enddate
  json.url agenda_url(agenda, format: :json)
end
