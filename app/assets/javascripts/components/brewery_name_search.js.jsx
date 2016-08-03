var BreweryNameSearch = React.createClass({
  render() {
    return (
    <div className="row">
      <div className="col-md-12">
        <div className="form-group brew-name-search text-center">
          <input className="form-control" type="text" id="brewery-name"></input>
          <input className="btn btn-default pull-right" id="brew-search-by-name" type="button" name="submit" value="Search By Name"></input>
          <br></br>
        </div>
        <hr></hr>
      </div>
    </div>
    )
  }
});
