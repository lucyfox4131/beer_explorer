var BeerNameSearch = React.createClass({
  render() {
    return (
    <div class="row">
      <div class="col-sm-8">
        <div class="form-group name-search text-center">
          <input class="form-control" type="text" id="beer-name"></input>
          <input class="btn btn-default pull-right" id="search-by-name" type="button" name="submit" value="Search By Name"></input>
        </div>
        <hr></hr>
      </div>
    </div>
    )
  }
});
