function clocks --wraps='watch -t -d -n 1 zdump America/Caracas America/Los_Angeles America/New_York' --description 'alias clocks watch -t -d -n 1 zdump America/Caracas America/Los_Angeles America/New_York'
  watch -t -d -n 1 zdump America/Caracas America/Los_Angeles America/New_York $argv
        
end
