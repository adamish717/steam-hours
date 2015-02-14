module EntriesHelper
  include ActionView::Helpers::DateHelper

  def pay_period d
    # Pay periods end every other Tuesday
    first_payday = Date.new(2015, 01, 07)
    previous_wed = d.advance(days: -((d.wday - 3)%7))
    was_a_payday = (previous_wed - first_payday).to_i.abs % 14 == 0
    previous_payday = was_a_payday ? previous_wed : previous_wed.advance(weeks: -1)
    previous_payday.to_datetime ... previous_payday.advance(days: 13).to_datetime.end_of_day
  end

  def previous_pay_period pp
    pay_period pp.begin.advance(days: -1)
  end

  def next_pay_period pp
    if pp.end < Date.current
      pay_period pp.end.advance(days: 1)
    else
      nil
    end
  end

  def date_str d
    d.to_date.to_s(:long)
  end

  def pp_start_str pp
    pp.begin.to_date.to_s
  end
end
