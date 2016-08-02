var BeerNameSearch = React.createClass({
  render() {
    return (
    <div class="row">
      <div class="col-sm-2"></div>
      <div class="col-sm-8">
        <div class="form-group name-search">
          <input class="form-control" type="text" id="beer-name"></input>
        </div>
        <input class="btn btn-default pull-right" id="search-by-name" type="button" name="submit" value="Search By Name"></input>
        <hr></hr>
      </div>
      <div class="col-sm-2"></div>
    </div>
    )
  }
});
