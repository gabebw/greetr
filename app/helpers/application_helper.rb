module ApplicationHelper
  def in_local_time(time)
    time.in_time_zone("EST").strftime("%Y-%m-%d %l:%M:%S %p")
  end
end
