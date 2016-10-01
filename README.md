# Catawiki

## Notes
There are some cases that have been ignored, since the main focus was on the OO coding and the styling, those could still be implemented, but the desired behaviour needs to be specified.

## Simple workflow description
There's a class for the map and the rover, the rover objects are added to the map object, each rover is instructed to move, and when the input file is ended, we ask the map to render it's rovers in the output format requested.

## About the code
### The map
The map object is intialized by the top right coordinates, then we could call `map.deploy_rover` to add rovers to this map.

I've ignored the case when rovers could go outside the edges, because I wasn't sure what the desired behaviour was, could either be prevent the rover from moving, or mark that the rover has fallen outside the edge and we loose control over it, this could be added easily in the future.

### The rover
The rover object is initialized by it's coordinates and it's orientation, the rover then has 3 commands that could be called `move`, `rotate_right`, and `rotate_left`, each command updates the rover's information.

Like I mentioned before, currently the rover is allowed to go outside the map boundaries, and still continue moving, and the map reports this rover when rendering it self at the end.

There's another condition when two rovers crash together, we are supposed to run the rovers in sequence, which might result in a rover hitting a stationary rover, this case isn't handled either.

## The gem
### Installation
The gem could be installed directly from github by using this command
```ruby
gem install catawiki -s https://github.com/coalwater/catawiki
```
### Execution
The gem is installed as an executable, and could be ran right from the terminal after installation, the executable expects a single parameter, which is the input file path, eg:
```ruby
catawiki input.txt
```

