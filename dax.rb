$v = $mod.entities[433].transformation.origin.to_a
for i in 1..50
  $mod.entities[433].move! [$v[0]+i,$v[1]+i,$v[2]]
  $view.refresh
  sleep 0.001
end
v = nil
