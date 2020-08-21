class Time
  def self.parse_with_zone(str, opt = { format: '%H%M%S', zone: 'Brasilia' })
    convert = strptime(str, opt[:format])
    n = now.in_time_zone(opt[:zone])
    n += (convert.hour - n.hour).hour
    n += (convert.min - n.min).minutes
    n += (convert.sec - n.sec).seconds
    n
  end
end
