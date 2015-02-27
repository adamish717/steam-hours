module EntriesHelper
  include ActionView::Helpers::DateHelper

  def short_dotiw duration
    minutes = (duration / 60) % 60
    hours = duration / (60 * 60)
    if hours >= 1 && minutes >= 1
      format("%dhrs %dmins", hours, minutes)
    elsif hours >= 1
      format("%dhrs", hours)
    else
      format("%dmins", minutes)
    end
  end

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

  def time_billed entries
    return 0 unless entries.any?
    entries.sum { |e| time_range_length(e.duration) }
  end

  def time_range_length range
    (range.end - range.begin).to_i
  end

  def time_worked entries
    return 0 unless entries.any?
    durations_worked(entries).sum { |d| time_range_length(d) }
  end

  def durations_worked entries
    merge_time_ranges entries.map(&:duration)
  end

  def merge_time_ranges ranges
    ranges = ranges.sort_by { |d| d.begin.to_i }
    *merged = ranges.shift
    ranges.each do |r|
      lastr = merged[-1]
      if lastr.end >= r.begin
        merged[-1] = lastr.begin .. [r.end, lastr.end].max
      else
        merged << r
      end
    end
    merged
  end
end
