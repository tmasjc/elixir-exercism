defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [
    :nickname,
    battery_percentage: 100,
    distance_driven_in_meters: 0
  ]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(remote_car) when is_struct(remote_car, RemoteControlCar) do
    "#{remote_car.distance_driven_in_meters} meters"
  end

  def display_battery(remote_car) when is_struct(remote_car, RemoteControlCar) do
    pct = remote_car.battery_percentage
    case pct do
      0 -> "Battery empty"
      _ -> "Battery at #{pct}%"
    end
  end

  def drive(remote_car) when is_struct(remote_car, RemoteControlCar) do
    distance = remote_car.distance_driven_in_meters
    battery  = remote_car.battery_percentage
    if battery != 0 do
      %{remote_car | distance_driven_in_meters: distance + 20, battery_percentage: battery - 1}
    else
      remote_car
    end
  end

end
