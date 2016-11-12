class StatisticsController < ApplicationController
  def plot

  	@user = User.all
    r=0
    nr=0
    @user.each do |u|
      if u.read_more
        r+=1
      else
          nr+=1
      end
    end

    @persent = r.to_f / nr.to_f * 100.0
    readers = [r,0]
    non_readers = [nr,0]

    
    @bar_chart = Gchart.bar(
       :type => 'bar',
       :size => '400x400',
       :bar_colors => ['000000', '0088FF'],
       :title => "Histogramme des bouquineurs",
       :bg => 'EFEFEF',
       :legend => ['aime lire', "n'aime pas lire"],
       :data => [readers, non_readers],
       :filename => 'images/bar_chart.png',
       :stacked => false,
       :legend_position => 'bottom',
       :axis_with_labels => [['x'], ['y']],
       :max_value => (nr+r)*1.5,
       :min_value => 0,
       :axis_labels => [["A"]],
    )
  end

  def cv
  	@user = User.find(params[:id])
  end

  def list
  	@users = User.all
  	respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "report"
      end
    end
  end
end
