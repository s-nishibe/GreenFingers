module ApplicationHelper
  def simple_time(time)
    time.strftime("%Y年%m月%d日　")
  end

  def plant_kind(plant)
  	if plant.kind == 0
  	  return '一年草'
  	elsif plant.kind == 1
  	  return '多年草'
    elsif plant.kind == 2
      return '低木'
    else plant.kind == 3
      return '高木'
    end
  end

  def weather_info(weather)
  	if @blog.weather == 0
  	  return '晴れ'
    elsif @blog.weather == 1
      return '曇り'
    elsif @blog.weather == 2
      return '雨'
    else @blog.weather == 3
      return '雪'
    end
  end

  def topic_category(category)
  	if category == 0
  	  return '育て方全般'
  	elsif category == 1
  	  return 'せん定'
  	elsif category == 2
  	  return '土作り'
  	elsif category == 3
  	  return '肥料'
  	elsif category == 4
  	  return '病害虫'
  	else category == 5
  	  return 'その他'
  	end
  end

end

