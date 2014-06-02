# Create a color scheme, naming color patterns with symbol names.
ft = HighLine::ColorScheme.new do |cs|
  cs[:headline]         = [ :bold, :yellow ]
  cs[:bold]             = [ :bold, :white ]
  cs[:error]            = [ :bold, :red ]
end

# Assign that color scheme to HighLine...
HighLine.color_scheme = ft
                                      
