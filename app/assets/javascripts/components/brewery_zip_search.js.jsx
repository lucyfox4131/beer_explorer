var BreweryZipSearch = React.createClass({
  render() {
    return (
    <div className="row">
      <div className="col-md-12">
        <div className="form-group brew-zip-search text-center">
          <input className="form-control" type="text" id="brewery-zip"></input>
          <input className="btn btn-default pull-right" id="brew-search-by-zip" type="button" name="submit" value="Search Locations With ZipCode"></input>
          <br></br>
        </div>
        <hr></hr>
      </div>
    </div>
    )
  }
});
