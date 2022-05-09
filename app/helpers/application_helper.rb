module ApplicationHelper
  def simple_time(time)
    # time.strftime("%Y年%-m月%-d日(%a) %-H:%M")
    time.strftime("%Y年%-m月%-d日(#{I18n.t('date.abbr_day_names')[time.wday]}) %-H:%M")
  end
end
