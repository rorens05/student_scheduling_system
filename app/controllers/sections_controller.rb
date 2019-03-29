class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /sections
  # GET /sections.json
  def index
    @sections = Section.all
    if params[:school_year]
      @sections = Section.where(school_year: params[:school_year])
    end
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
  end

  # GET /sections/new
  def new
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        SubjectClass.create(schedule: "7:40 - 8:40", section_id: @section.id)
        SubjectClass.create(schedule: "8:40 - 9:40", section_id: @section.id)
        SubjectClass.create(schedule: "10:00 - 11:00", section_id: @section.id)
        SubjectClass.create(schedule: "11:00 - 12:00", section_id: @section.id)

        SubjectClass.create(schedule: "1:00 - 2:00", section_id: @section.id)
        SubjectClass.create(schedule: "2:00 - 3:00", section_id: @section.id)
        SubjectClass.create(schedule: "3:00 - 4:00", section_id: @section.id)
        SubjectClass.create(schedule: "4:00 - 5:00", section_id: @section.id)

        format.html { redirect_to @section, notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @section, notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:name, :school_year, :grade_id, :curriculum_id, :room)
    end
end
