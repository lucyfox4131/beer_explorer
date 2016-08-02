var BreweryNameSearch = React.createClass({
  render() {
    return (
    <div class="row">
      <div class="col-sm-2"></div>
      <div class="col-sm-8">
        <div class="form-group brew-name-search">
          <input class="form-control" type="text" id="brewery-name"></input>
        </div>
        <input class="btn btn-default pull-right" id="brew-search-by-name" type="button" name="submit" value="Search By Name"></input>
      </div>
      <hr></hr>
      <div class="col-sm-2"></div>
    </div>
    )
  }
});
