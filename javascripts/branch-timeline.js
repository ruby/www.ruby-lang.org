(function (){
  google.charts.load("current", {
    packages: ["timeline"]
  });
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
    const source =
      JSON.parse(document.getElementById("branches.json").innerHTML).slice(0, 5).reverse()
      .map(e => {
        return {
          ...e,
          date: new Date(e.date),
          security_maintenance_date: e.security_maintenance_date ? new Date(e.security_maintenance_date) : null,
          eol_date: e.eol_date ? new Date(e.eol_date) : null
        };
      });
    const container = document.getElementById('lifecycle-timeline');
    const options = {
      timeline: {
        groupByRowLabel: true,
        showBarLabels: false
      },
      alternatingRowStyle: false,
      enableInteractivity: false,
      tooltip: {
        isHtml: true
      }
    };

    container.style.height = `${50+source.length*42}px`
    const chart = new google.visualization.Timeline(container);
    const dataTable = new google.visualization.DataTable();
    const color_eol = '#555555';
    const colors = {
      past: {
        'normal maintenance': '#7f9382',
        'security maintenance': '#e7d9cb'
      },
      current: {
        'normal maintenance': '#028A0F',
        'security maintenance': '#F28C28'
      },
      future: {
        'normal maintenance': '#71b47b',
        'security maintenance': '#ffd58b'
      }
    }
    window.dt = dataTable;
    dataTable.addColumn({
      type: 'string',
      id: 'Version'
    });
    dataTable.addColumn({
      type: 'string',
      id: 'Status'
    });
    dataTable.addColumn({
      type: 'string',
      id: 'style',
      role: 'style'
    });
    dataTable.addColumn({
      type: 'date',
      id: 'Start'
    });
    dataTable.addColumn({
      type: 'date',
      id: 'End'
    });
    const today = new Date();
    const active = [];
    dataTable.addRows(source.map(e => {
      const name = e.name == 3 ? "3.0" : `${e.name}`;
      let color1 = colors.current["normal maintenance"];
      let color2 = colors.current["security maintenance"];
      const status = e.status.toUpperCase();
      let eol_date = e.eol_date;
      if (!eol_date) {
        eol_date = new Date(e.date.getFullYear() + 4, 2, 31);
      }
      let security_maintenance_date = e.security_maintenance_date;
      if (!security_maintenance_date) {
        security_maintenance_date = new Date(e.date.getFullYear() + 3, 2, 31);
      }
      if (security_maintenance_date < today) {
        color1 = colors.past["normal maintenance"];
      } else if (today < e.date) {
        color1 = colors.future["normal maintenance"];
      } else {
        active.push(name);
      }
      if (eol_date < today) {
        color2 = colors.past["security maintenance"];
      } else if (today < security_maintenance_date) {
        color2 = colors.future["security maintenance"];
      } else {
        active.push(name);
      }
      return [[
        name,
        "NORMAL MAINTENANCE",
        color1,
        e.date,
        security_maintenance_date,
      ],[
        name,
        "SECURITY MAINTENANCE",
        color2,
        security_maintenance_date,
        eol_date,
      ]];
    }).flat());

    var todayColor = "#ff0000";
    dataTable.addRows([[source[0].name,"today",todayColor,today,today]]);

    window.addEventListener("resize", () => {
      if (this.resizeTO) clearTimeout(this.resizeTO);
      this.resizeTO = setTimeout(() => {
        window.dispatchEvent(new Event('resizeEnd'));
      }, 500);
    });
    window.addEventListener("resizeEnd", () => {
      const tooltips = document.querySelectorAll(".rlo-timeline-tooltip");
      for(const tooltip of tooltips){tooltip.parentElement.remove();}
      chart.draw(dataTable, options);
    });
    google.visualization.events.addListener(chart, 'ready', ()=>{
      const line = document.querySelector(`rect[fill="${todayColor}"]`);
      line.parentElement.appendChild(line);
      active.forEach(a=>{
        $(`text:contains("${a}")`).css({"font-weight": 900});
      });
    });
    chart.draw(dataTable, options);
  }
})();
