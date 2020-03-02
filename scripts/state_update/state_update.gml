if state_next != state {
  state=state_next
  state_timer=0
} else {
  state_timer++
}