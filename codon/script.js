function synthesize() {
    var alist = document.getElementById('amino-list');
    while (alist.firstChild) {
        alist.removeChild(alist.firstChild);
    }
    var seq = document.getElementById('codon').value.replace(/ /g,'');
    var amino = [];
    var currseq = [];
    for (var i = 0; i < seq.length + 1; i++) {
        // currseq.push(seq[i]);
        // if (currseq.length == 3) {
        //     amino.push(addAmino(currseq));
        //     currseq = [];
        // }
        if (currseq.length == 3) {
            amino.push(addAmino(currseq));
            currseq = [];
        }
        currseq.push(seq[i]);
        console.log(i);
    }
    console.log(amino);
    for (var i = 0; i < amino.length; i++) {
        var entry = document.createElement('li');
        entry.appendChild(document.createTextNode(amino[i]));
        alist.appendChild(entry);
        console.log("appending data");
    }
}

function addAmino(codon) {
    console.log(codon);

    switch (codon[0]) {
        case "A":
        case "a":
            switch (codon[1]) {
                case "A":
                case "a":
                    switch (codon[2]) {
                        case "A":
                        case "a":
                            console.log("Lysine");
                            return "(Lys/K) Lysine";
                            break;
                        case "C":
                        case "c":
                            console.log("Asparagine");
                            return "(Asp/N) Asparagine";
                            break;

                        case "G":
                        case "g":
                            console.log("Lysine");
                            return "(Lys/K) Lysine";
                            break;

                        case "U":
                        case "u":
                            console.log("Asparagine");
                            return "(Asp/N) Asparagine";
                            break;

                        default:
                            console.log("That's not a thing...");
                            return "[ERROR]";
                    }
                    break;
                case "C":
                case "c":
                    switch (codon[2]) {
                        case "A":
                        case "a":
                            console.log("Threonine");
                            return "(Thr/T) Threonine";
                            break;
                        case "C":
                        case "c":
                            console.log("Threonine");
                            return "(Thr/T) Threonine";
                            break;

                        case "G":
                        case "g":
                            console.log("Threonine");
                            return "(Thr/T) Threonine";
                            break;

                        case "U":
                        case "u":
                            console.log("Threonine");
                            return "(Thr/T) Threonine";
                            break;

                        default:
                            console.log("That's not a thing...");
                            return "[ERROR]";
                    }
                    break;

                case "G":
                case "g":
                    switch (codon[2]) {
                        case "A":
                        case "a":
                            console.log("Arginine");
                            return "(Arg/R) Arginine";
                            break;
                        case "C":
                        case "c":
                            console.log("Serine");
                            return "(Ser/S) Serine";
                            break;

                        case "G":
                        case "g":
                            console.log("Arginine");
                            return "(Arg/R) Arginine";
                            break;

                        case "U":
                        case "u":
                            console.log("Serine");
                            return "(Ser/S) Serine";
                            break;

                        default:
                            console.log("That's not a thing...");
                            return "[ERROR]";
                    }
                    break;

                case "U":
                case "u":
                    switch (codon[2]) {
                        case "A":
                        case "a":
                            console.log("Isoleucine");
                            return "(Ile/I) Isoleucine";
                            break;
                        case "C":
                        case "c":
                            console.log("Isoleucine");
                            return "(Ile/I) Isoleucine";
                            break;

                        case "G":
                        case "g":
                            console.log("[Start Sequence]");
                            return "[START] (Met/M) Methionine";
                            break;

                        case "U":
                        case "u":
                            console.log("Isoleucine");
                            return "(Ile/I) Isoleucine";
                            break;

                        default:
                            console.log("That's not a thing...");
                            return "[ERROR]";
                    }
                    break;

                default:
                    console.log("That's not a thing...");
                    return "[ERROR]";
            }
            break;

        case "C":
        case "c":
            switch (codon[1]) {
                case "A":
                case "a":
                    switch (codon[2]) {
                        case "A":
                        case "a":
                            console.log("Glutamine");
                            return "(Gln/Q) Glutamine";
                            break;
                        case "C":
                        case "c":
                            console.log("Histidine");
                            return "(His/H) Histidine";
                            break;

                        case "G":
                        case "g":
                            console.log("Glutamine");
                            return "(Gln/Q) Glutamine";
                            break;

                        case "U":
                        case "u":
                            console.log("Histidine");
                            return "(His/H) Histidine";
                            break;

                        default:
                            console.log("That's not a thing...");
                            return "[ERROR]";
                    }
                    break;

                case "C":
                case "c":
                    switch (codon[2]) {
                        case "A":
                        case "a":
                            console.log("Proline");
                            return "(Pro/P) Proline";
                            break;
                        case "C":
                        case "c":
                            console.log("Proline");
                            return "(Pro/P) Proline";
                            break;

                        case "G":
                        case "g":
                            console.log("Proline");
                            return "(Pro/P) Proline";
                            break;

                        case "U":
                        case "u":
                            console.log("Proline");
                            return "(Pro/P) Proline";
                            break;

                        default:
                            console.log("That's not a thing...");
                            return "[ERROR]";
                    }
                    break;

                case "G":
                case "g":
                    switch (codon[2]) {
                        case "A":
                        case "a":
                            console.log("Arginine");
                            return "(Arg/R) Arginine";
                            break;
                        case "C":
                        case "c":
                            console.log("Arginine");
                            return "(Arg/R) Arginine";
                            break;

                        case "G":
                        case "g":
                            console.log("Arginine");
                            return "(Arg/R) Arginine";
                            break;

                        case "U":
                        case "u":
                            console.log("Arginine");
                            return "(Arg/R) Arginine";
                            break;

                        default:
                            console.log("That's not a thing...");
                            return "[ERROR]";
                    }
                    break;

                case "U":
                case "u":
                    switch (codon[2]) {
                        case "A":
                        case "a":
                            console.log("Leucine");
                            return "(Leu/L) Leucine";
                            break;
                        case "C":
                        case "c":
                            console.log("Leucine");
                            return "(Leu/L) Leucine";
                            break;

                        case "G":
                        case "g":
                            console.log("Leucine");
                            return "(Leu/L) Leucine";
                            break;

                        case "U":
                        case "u":
                            console.log("Leucine");
                            return "(Leu/L) Leucine";
                            break;

                        default:
                            console.log("That's not a thing...");
                            return "[ERROR]";
                    }
                    break;

                default:
                    console.log("That's not a thing...");
                    return "[ERROR]";
            }
            break;

        case "G":
        case "g":
            switch (codon[1]) {
                case "A":
                case "a":
                    switch (codon[2]) {
                        case "A":
                        case "a":
                            console.log("Glutamic Acid");
                            return "(Glu/E) Glutamic Acid";
                            break;
                        case "C":
                        case "c":
                            console.log("Aspartic Acid");
                            return "(Asp/D) Aspartic Acid";
                            break;

                        case "G":
                        case "g":
                            console.log("Glutamic Acid");
                            return "(Glu/E) Glutamic Acid";
                            break;

                        case "U":
                        case "u":
                            console.log("Aspartic Acid");
                            return "(Asp/D) Aspartic Acid";
                            break;

                        default:
                            console.log("That's not a thing...");
                            return "[ERROR]";
                    }
                    break;

                case "C":
                case "c":
                    switch (codon[2]) {
                        case "A":
                        case "a":
                            console.log("Alanine");
                            return "(Ala/A) Alanine";
                            break;
                        case "C":
                        case "c":
                            console.log("Alanine");
                            return "(Ala/A) Alanine";
                            break;

                        case "G":
                        case "g":
                            console.log("Alanine");
                            return "(Ala/A) Alanine";
                            break;

                        case "U":
                        case "u":
                            console.log("Alanine");
                            return "(Ala/A) Alanine";
                            break;

                        default:
                            console.log("That's not a thing...");
                            return "[ERROR]";
                    }
                    break;

                case "G":
                case "g":
                    switch (codon[2]) {
                        case "A":
                        case "a":
                            console.log("Glycine");
                            return "(Gly/G) Glycine";
                            break;
                        case "C":
                        case "c":
                            console.log("Glycine");
                            return "(Gly/G) Glycine";
                            break;

                        case "G":
                        case "g":
                            console.log("Glycine");
                            return "(Gly/G) Glycine";
                            break;

                        case "U":
                        case "u":
                            console.log("Glycine");
                            return "(Gly/G) Glycine";
                            break;

                        default:
                            console.log("That's not a thing...");
                            return "[ERROR]";
                    }
                    break;

                case "U":
                case "u":
                    switch (codon[2]) {
                        case "A":
                        case "a":
                            console.log("Valine");
                            return "(Val/V) Valine";
                            break;
                        case "C":
                        case "c":
                            console.log("Valine");
                            return "(Val/V) Valine";
                            break;

                        case "G":
                        case "g":
                            console.log("Valine");
                            return "(Val/V) Valine";
                            break;

                        case "U":
                        case "u":
                            console.log("Valine");
                            return "(Val/V) Valine";
                            break;

                        default:
                            console.log("That's not a thing...");
                            return "[ERROR]";
                    }
                    break;

                default:
                    console.log("That's not a thing...");
                    return "[ERROR]";
            }
            break;

        case "U":
        case "u":
            switch (codon[1]) {
                case "A":
                case "a":
                    switch (codon[2]) {
                        case "A":
                        case "a":
                            console.log("[Stop Sequence (Ochre)]");
                            return "[STOP] Ochre";
                            break;
                        case "C":
                        case "c":
                            console.log("Tyrosine");
                            return "(Tyr/Y) Tyrosine";
                            break;

                        case "G":
                        case "g":
                            console.log("[Stop Sequence (Amber)]");
                            return "[STOP] Amber";
                            break;

                        case "U":
                        case "u":
                            console.log("Tyrosine");
                            return "(Tyr/Y) Tyrosine";
                            break;

                        default:
                            console.log("That's not a thing...");
                            return "[ERROR]";
                    }
                    break;

                case "C":
                case "c":
                    switch (codon[2]) {
                        case "A":
                        case "a":
                            console.log("Serine");
                            return "(Ser/S) Serine";
                            break;
                            break;
                        case "C":
                        case "c":
                            console.log("Serine");
                            return "(Ser/S) Serine";
                            break;

                        case "G":
                        case "g":
                            console.log("Serine");
                            return "(Ser/S) Serine";
                            break;

                        case "U":
                        case "u":
                            console.log("Serine");
                            return "(Ser/S) Serine";
                            break;

                        default:
                            console.log("That's not a thing...");
                            return "[ERROR]";
                    }
                    break;

                case "G":
                case "g":
                    switch (codon[2]) {
                        case "A":
                        case "a":
                            console.log("[Stop Sequence (Opal)]");
                            return "[STOP] Opal";
                            break;
                        case "C":
                        case "c":
                            console.log("Cysteine");
                            return "(Cys/C) Cysteine";
                            break;

                        case "G":
                        case "g":
                            console.log("Tryptophan");
                            return "(Trp/W) Tryptophan";
                            break;

                        case "U":
                        case "u":
                            console.log("Cysteine");
                            return "(Cys/C) Cysteine";
                            break;

                        default:
                            console.log("That's not a thing...");
                            return "[ERROR]";
                    }
                    break;

                case "U":
                case "u":
                    switch (codon[2]) {
                        case "A":
                        case "a":
                            console.log("Leucine");
                            return "(Leu/L) Leucine";
                            break;
                        case "C":
                        case "c":
                            console.log("Phenylalanine");
                            return "(Phe/F) Phenylalanine";
                            break;

                        case "G":
                        case "g":
                            console.log("Leucine");
                            return "(Leu/L) Leucine";
                            break;

                        case "U":
                        case "u":
                            console.log("Phenylalanine");
                            return "(Phe/F) Phenylalanine";
                            break;

                        default:
                            console.log("That's not a thing...");
                            return "[ERROR]";
                    }
                    break;

                default:
                    console.log("That's not a thing...");
                    return "[ERROR]";
            }
            break;

        default:
            console.log("That's not a thing...");
            return "[ERROR]";
    }
}
