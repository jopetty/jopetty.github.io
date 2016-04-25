
var tableDiv;

window.onload = function declareTableDiv() {
    tableDiv = document.getElementById('punnetSquare');
}

function csort(x,y) {
    if (x.toLowerCase() !== y.toLowerCase()) {
        x = x.toLowerCase();
        y = y.toLowerCase();
    }
    return x > y ? 1 : (x < y ? -1 : 0);
}

function evalForm() {

    // Declare variables
    var maternal = document.getElementById('m').value;
    var paternal = document.getElementById('p').value;
    var same = document.getElementById('s').checked;
    var mGenome = [];
    var pGenome = [];
    var mSubLength = true;
    var pSubLength = true;
    var gRatio = [];

    if (same) {

        // Set Maternal Genome
        for (var i = 0; i < maternal.length; i+=2) {
            try {
                mGenome.push([ maternal[i], maternal[i+1] ]);
            } catch (e) {
                console.log(e);
            }
        }

        // Set Paternal Genome
        pGenome = mGenome;

    } else {

        // Set Maternal Genome
        for (var i = 0; i < maternal.length; i+=2) {
            try {
                mGenome.push([ maternal[i], maternal[i+1] ]);
            } catch (e) {
                console.log(e);
            }

            // if (maternal[i].length % 2 != 0) {
            //     alert('Maternal genome does not have an even number of alleles');
            //     mSubLength = false;
            //     break;
            // }
        }

        // Set Paternal Genome
        for (var i = 0; i < paternal.length; i+=2) {
            try {
                pGenome.push([ paternal[i], paternal[i+1] ]);
            } catch (e) {
                console.log(e);
            }

            // if (paternal[i].length % 2 != 0) {
            //     alert('Paternal genome does not have an even number of alleles');
            //     pSubLength = false;
            //     break;
            // }
        }

        var mm = genGametes(mGenome);
        var pp = genGametes(pGenome);

        // Delete all children of tableDiv
        while (tableDiv.firstChild) {
            tableDiv.removeChild(tableDiv.firstChild);
        }

        // Make sure that both genomes have the same length
        if ((pGenome.length == mGenome.length) && mSubLength && pSubLength) {
            var tbl = document.createElement('table');
            // Generate table
            for (var i = 0; i < mm.length + 1; i++) {
                tr = tbl.insertRow(i);
                if (i == 0) {
                    for (var j = 0; j < pp.length + 1; j++) {
                        if (j == 0) {
                            td = tr.insertCell(j);
                            td.innerHTML = '';
                            td.style.backgroundColor = '#ddd';
                            td.style.border = 'solid 1px #ccc';
                        } else {
                            td = tr.insertCell(j);
                            td.innerHTML = pp[j-1];
                            td.style.fontWeight = 'bold';
                            td.style.textAlign = 'center';
                            td.style.padding = '20px';
                            td.style.backgroundColor = '#ddd';
                            td.style.border = 'solid 1px #ccc';
                        }
                    }
                } else {
                    for (var j = 0; j < pp.length + 1; j++) {
                        if (j == 0) {
                            td = tr.insertCell(j);
                            td.innerHTML = mm[i-1];
                            td.style.fontWeight = 'bold';
                            td.style.textAlign = 'center';
                            td.style.padding = '20px';
                            td.style.backgroundColor = '#ddd';
                            td.style.border = 'solid 1px #ccc';
                        } else {
                            td = tr.insertCell(j);
                            var a = mm[i-1] + pp[j-1];
                            a = a.split('').sort(csort).join('');
                            td.innerHTML = a;
                            td.style.textAlign = 'center';
                            td.style.border = 'solid 1px #ccc';

                        }
                    }
                }
            }
            tbl.style.margin = "0 auto";
            tbl.style.fontSize = "1.2rem";
            tbl.style.border = "1px solid #ccc";
            tbl.style.borderCollapse = 'collapse';
            tableDiv.appendChild(tbl);
        } else {
            alert("Warning: length of maternal and paternal genomes does not match")
        }

    }
}

function genGametes(arr) {
    if (arr.length == 1) {
        return arr[0];
    } else {
        var result = [];
        var remainder = genGametes(arr.slice(1));
        for (var i = 0; i < remainder.length; i++) {
            for (var j = 0; j < arr[0].length; j++) {
                result.push(arr[0][j] + remainder[i]);
            }
        }
        return result;
    }
}
