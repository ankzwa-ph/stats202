class TaskStatsController < ApplicationController
  before_action :set_task_stat, only: [:show, :edit, :update, :destroy]

  # GET /task_stats
  # GET /task_stats.json
  def index
    @search = Search::TaskStat.new(extract_processing_date)
    @task_stats = @search.matches
    gon.stats_open        = @task_stats.select(:open).map { |x| x[:open] }
    gon.stats_in_progress = @task_stats.select(:in_progress).map { |x| x[:in_progress] }
    gon.stats_resolved    = @task_stats.select(:resolved).map { |x| x[:resolved] }
    gon.stats_today       = TaskStatus.all.map(&:name).map { |x| @task_stats.last[x] }
  end

  # GET /task_stats/1
  # GET /task_stats/1.json
  def show
  end

  # GET /task_stats/new
  def new
    @task_stat = TaskStat.new
  end

  # GET /task_stats/1/edit
  def edit
  end

  # POST /task_stats
  # POST /task_stats.json
  def create
    @task_stat = TaskStat.new(task_stat_params)

    respond_to do |format|
      if @task_stat.save
        format.html { redirect_to @task_stat, notice: 'Task stat was successfully created.' }
        format.json { render :show, status: :created, location: @task_stat }
      else
        format.html { render :new }
        format.json { render json: @task_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_stats/1
  # PATCH/PUT /task_stats/1.json
  def update
    respond_to do |format|
      if @task_stat.update(task_stat_params)
        format.html { redirect_to @task_stat, notice: 'Task stat was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_stat }
      else
        format.html { render :edit }
        format.json { render json: @task_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_stats/1
  # DELETE /task_stats/1.json
  def destroy
    @task_stat.destroy
    respond_to do |format|
      format.html { redirect_to task_stats_url, notice: 'Task stat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_stat
      @task_stat = TaskStat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_stat_params
      params.require(:task_stat).permit(:open, :in_progress, :resolved, :closed, :total, :processing_date)
    end

    def search_params
      params.permit(processing_date: [:date_from])
    end

    def extract_processing_date
      processing_date = search_params[:processing_date]
      return {} if processing_date.nil?
      { date_from: processing_date.values.join("-") }
    end
end
