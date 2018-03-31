module StatesHelper
  def all_state
    State.all.collect { |x| [x.name, x.id] }
  end
end
