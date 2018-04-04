class VisitorDetailsController < ApplicationController
  before_action :set_visitor_detail, only: [:show, :edit, :update, :destroy]

  # GET /visitor_details
  # GET /visitor_details.json
  def index
    @visitor_details = VisitorDetail.all
  end

  # GET /visitor_details/1
  # GET /visitor_details/1.json
  def show
  end

  # GET /visitor_details/new
  def new
    @visitor_detail = VisitorDetail.new
    session[:active_tab] = "InformationManagement"
  end

  # GET /visitor_details/1/edit
  def edit
  end

  # POST /visitor_details
  # POST /visitor_details.json
  def create
     # byebug
    @visitor_detail = VisitorDetail.new(visitor_detail_params)

    respond_to do |format|
      if @visitor_detail.save
        format.html { redirect_to @visitor_detail, notice: 'Visitor detail was successfully created.' }
        format.json { render :show, status: :created, location: @visitor_detail }
        # redirect_to visitor_details_path
      else
        format.html { render :new }
        format.json { render json: @visitor_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitor_details/1
  # PATCH/PUT /visitor_details/1.json
  def update
    respond_to do |format|
      if @visitor_detail.update(visitor_detail_params)
        format.html { redirect_to @visitor_detail, notice: 'Visitor detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @visitor_detail }
      else
        format.html { render :edit }
        format.json { render json: @visitor_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitor_details/1
  # DELETE /visitor_details/1.json
  def destroy
    @visitor_detail.destroy
    respond_to do |format|
      format.html { redirect_to visitor_details_url, notice: 'Visitor detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download_person_image
    @visitor_detail = VisitorDetail.find(params[:id])
    if File.exist?(@visitor_detail.avatar.path)
    send_file @visitor_detail.avatar.path,
              filename: @visitor_detail.avatar,
              type: @visitor_detail.avatar_content_type,
              disposition: 'inline'
    else
    flash[:alert] = "No file found Please contact to Admin!"
    redirect_to root_url
    end
  end

  def display_visiting_card
     @visitor_detail = VisitorDetail.find(params[:id])
     @visitor_details = VisitorDetail.where(id: @visitor_detail.id)
  end

  def print_visitor_card
     @visitor_detail = VisitorDetail.find(params[:id])
     @visitor_details = VisitorDetail.where(id: @visitor_detail.id)
    respond_to do |format|
        format.html
        format.pdf do
        render :pdf => 'print_visitor_card',
        layout: '/layouts/pdf.html.erb',
        :template => 'visitor_details/print_visitor_card.pdf.erb',
        :orientation      => 'Landscape', # default , Landscape
        :page_height      => 1000,
        :dpi              => '300',
        :margin           => {:top    => 20, # default 10 (mm)
                      :bottom => 20,
                      :left   => 20,
                      :right  => 20},
        :show_as_html => params[:debug].present?
     end
    end
  end

  def visitor_date_report
    session[:active_tab] = "InformationManagement"
  end

  def print_visitor_report
    @from = params[:salary] ? params[:salary][:from_date] : params[:from_date] 
    @to = params[:salary] ? params[:salary][:to_date] : params[:to_date]
    @visitor_details = VisitorDetail.where(visiting_date:  @from.to_date..@to.to_date)

     respond_to do |format|
     format.js
     format.xls {render template: 'visitor_details/visiting_date_report_xls.xls.erb'}
     format.html
     format.pdf do
      render pdf: 'visiting_date_report_pdf',
            layout: 'pdf.html',
            orientation: 'Landscape',
            template: 'visitor_details/visiting_date_report_pdf.pdf.erb',
            # show_as_html: params[:debug].present?,
            :page_height      => 1000,
            :dpi              => '300',
            :margin           => {:top    => 10, # default 10 (mm)

                          :bottom => 10,
                          :left   => 20,
                          :right  => 20},
            :show_as_html => params[:debug].present?
        end
      end
  end

  def visitor_list
    @visitor_details = VisitorDetail.where(employee_id: current_user.employee_id)
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor_detail
      @visitor_detail = VisitorDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visitor_detail_params
      params.require(:visitor_detail).permit(:name, :age, :contact_no, :email_id, :id_proof, :from, :meet_to_id, :in_time, :out_time, :purpose, :authorized_by_id,:employee_id,:avatar,:visiting_date)
    end
end
