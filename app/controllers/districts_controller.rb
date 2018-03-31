
# require 'query_report/helper'  # need to require the helper
class DistrictsController < ApplicationController
  before_action :set_district, only: [:show, :edit, :update, :destroy]
  # include QueryReport::Helper  # need to include it

  
  def new
    @district = District.new
    @districts = District.all
  end

  # GET /districts/1/edit
  def edit
  end

  # POST /districts
  # POST /districts.json
  def create
    @district = District.new(district_params)
    @districts = District.all
    respond_to do |format|
      if @district.save
        @district = District.new
       format.js { @flag = true }
      else
        flash.now[:alert] = 'district Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /districts/1
  # PATCH/PUT /districts/1.json
  def update
     @district.update(district_params)
     @districts = District.all
     @district = District.new

  end

  # DELETE /districts/1
  # DELETE /districts/1.json
  def destroy
    @district.destroy
    @districts = District.all
  end

   def list_district
    reporter(District.filter_records(current_user), template_class: PdfReportTemplate) do
      column(:ID, sortable: true) { |district| district.id }
      column(:SID, sortable: true) { |district| district.state_id }
      column(:Code, sortable: true) { |district| district.code }
      column(:Name, sortable: true) { |district| district.name }
    end
  end

  def district_master
    @districts = District.all
     respond_to do |f|
      f.js
      f.xls {render template: 'districts/district_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' district_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'districts/district_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_district
    @district = District.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def district_params
    params.require(:district).permit(:state_id, :code, :name)
  end
end
