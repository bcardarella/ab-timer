defmodule AbWorkout do
  def say(words) do
    IO.puts(words)
    System.cmd("say", [words])
  end

  def sleep(seconds) do
    :timer.sleep(seconds * 1000)
  end

  def get_ready()  do
    say("Get ready for ab work out. Starting in...")
    count(5)
  end

  def count(count) do
    count..1
    |> Enum.each(fn(n) ->
      n
      |> Integer.to_string()
      |> say()
      sleep(1)
    end)
  end

  def all_done() do
    say("You are done!")
  end

  def exercise({name, time}) do
    say("#{name} for #{time} seconds. Go!")
    half =
      (time / 2)
      |> round()

    remainder = half - 5
    sleep(half)
    say("#{half} seconds remaining...")
    sleep(remainder)
    count(5)

    say("Done with #{name}")
  end

  def workout() do
    exercises = [
      {"Figure 8s", 60},
      {"Windshield Wipers", 60},
      {"Twisting Pistons", 60},
      {"Rest", 30},
      {"Starfish Crunch", 30},
      {"Tuck Planks Same Side", 60},
      {"Upper Circle Crunches Clockwise", 60},
      {"Upper Circle Crunches Counter-Clockwise", 60}
    ]

    get_ready()

    exercises
    |> Enum.each(&(exercise(&1)))

    all_done()
  end
end

AbWorkout.workout()
