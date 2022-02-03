# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start_link(fn -> {0, []} end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn {_, regs} -> regs end)
  end

  def register(pid, name) do
    Agent.get_and_update(pid, fn {id, regs} ->
      new_reg = do_register_plot(id + 1, name)
      {new_reg, {id + 1, [new_reg | regs]}}
    end)
  end

  defp do_register_plot(id, name) do
    %Plot{plot_id: id, registered_to: name}
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn {id, regs} ->
      new_regs = for l <- regs, l.plot_id != plot_id, do: l
      {id, new_regs}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn {_, regs} ->
      ind = for l <- regs, l.plot_id == plot_id, do: l
      find_plot_id(ind)
    end)
  end

  defp find_plot_id([]), do: {:not_found, "plot is unregistered"}
  defp find_plot_id([owner] = [%Plot{plot_id: _id, registered_to: _name}]), do: owner

end
