#lang pollen

◊(define-meta title "Sequence-to-Sequence Networks Learn the Meaning of Reflexive Anaphora"
              template "../template.html.p" 
              published "Friday, 20 November 2020"
              author "Robert Frank and Jackson Petty (Equal Contribution)"
              excerpt (list ""))

◊(define syndication-links 
         (list 
          (list "arxiv" "https://arxiv.org/abs/2011.00682" "2011.00682")
          (list "pdf" "/papers/frank-petty-sequence-anaphora.pdf" "pdf")))

◊declare-work[#:id "bhadanau2016" #:type "article" #:title "Neural machine translation by jointly learning to align and translate" #:url "http://arxiv.org/abs/1409.0473" #:author "Dzmitry Bahdanau" #:author2-given "Kyunghyun" #:author2-family "Cho" #:author3-given "Yoshua" #:author3-family "Bengio" #:year "2016" #:journal "arXiv"]

◊declare-work[#:id "Charter" #:type "custom" #:custom-format "*Canadian Charter of Rights and Freedoms*[[pinpoint]], Part I of the *Constitution Act, 1982*, being Schedule B to the *Canada Act 1982* (UK), 1982, c 11" #:short-form "*Charter*"]

◊h1{Sequence-to-Sequence Networks Learn the Meaning of Reflexive Anaphora}

◊h3{Robert Frank and Jackson Petty}

◊abstract{
  ◊p{Reflexive anaphora present a challenge for semantic interpretation: their meaning varies depending on context in a way that appears to require abstract variables. Past work has raised doubts about the ability of recurrent networks to meet this challenge. In this paper, we explore this question in the context of a fragment of English that incorporates the relevant sort of contextual variability. We consider sequence-to-sequence architectures with recurrent units and show that such networks are capable of learning semantic interpretations for reflexive anaphora which generalize to novel antecedents. We explore the effect of attention mechanisms and different recurrent unit types on the type of training data that is needed for success as measured in two ways: how much lexical support is needed to induce an abstract reflexive meaning (i.e., how many distinct reflexive antecedents must occur during training) and what contexts must a noun phrase occur in to support generalization of reflexive interpretation to this noun phrase?}
}

◊div[#:style "display: block; background-color: #fc6; padding: 10px; border-left: solid 5px #fa3;"]{
  ◊p[#:style "color: #000;"]{◊strong{NB:} This is an incomplete transcription of the ◊link["https://www.aclweb.org/anthology/2020.crac-1.16/"]{published version} into HTML.}
}

◊section{Introduction}

Recurrent neural network architectures have demonstrated remarkable success in natural language processing, achieving state of the art performance across an impressive range of tasks ranging from machine translation to semantic parsing to question answering (Sutskever et al., 2014; Cho et al., 2014; Bahdanau et al., 2016). These tasks demand the use of a wide variety of computational processes and information sources (from grammatical to lexical to world knowledge), and are evaluated in coarse-grained quantitative ways. As a result, it is not an easy matter to identify the specific strengths and weaknesses in a network’s solution of a task.

In this paper, we take a different tack, exploring the degree to which neural networks successfully master one very specific aspect of linguistic knowledge: the interpretation of sentences containing reflexive anaphora. We address this problem in the context of the task of semantic parsing, which we instantiate as mapping a sequence of words into a predicate calculus logical form representation of the sentence’s meaning.

◊; ◊ex

◊; Recurrent neural network architectures have demonstrated remarkable success in natural language processing, achieving state of the art performance across an impressive range of tasks ranging from machine translation to semantic parsing to question answering   bhadanau2016 Cho et al. (2014); Bahdanau et al. (2016). These tasks demand the use of a wide variety of computational processes and information sources (from grammatical to lexical to world knowledge), and are evaluated in coarse grained quantitative ways. As a result, it is not an easy matter to identify the strengths and weaknesses in a network’s solution of a task.

◊; ◊; ◊note-cite["bhadanau2016"]

◊; In this paper, we take a different tack, exploring the degree to which neural networks successfully master one very specific aspect of linguistic knowledge, the interpretation of sentences containing reflexive anaphora. We address this problem in the context of the task of semantic parsing, which we conceptualize as mapping a sequence of words into a predicate calculus logical form representation of the sentence’s meaning.

◊; ◊sequence{
◊;   ◊item{
◊;     ◊sequence{
◊;       ◊item{◊p{Mary runs → ◊span[#:style "font-variant:small-caps;"]{run(mary)}}}
◊;       ◊item{◊p{John sees Bob → ◊span[#:style "font-variant:small-caps;"]{see(john, bob)}}}
◊;     }
◊;   }
◊; }

◊; For sentences like those in (1), the network must learn lexical semantic correspondences (e.g., the input symbol ◊em{Mary} is mapped to the output ◊span[#:style "font-variant:small-caps;"]{mary} and ◊em{runs} is mapped to ◊span[#:style "font-variant:small-caps;"]{run}) and a mode of composition (e.g., for an intransitive sentence, the meaning of the subject is surrounded by parentheses and appended to the meaning of the verb). Unfortunately, not all of natural language adheres to this simple formula. Reflexives, words like herself and himself, do not have an interpretation that can be assigned independently of the meaning of the surrounding context.

◊; ◊sequence{
◊;   ◊item{
◊;     ◊sequence{
◊;       ◊item{◊p{Mary sees herself → ◊span[#:style "font-variant:small-caps;"]{see(mary, mary)}}}
◊;       ◊item{◊p{Alice sees herself → ◊span[#:style "font-variant:small-caps;"]{see(alice, alice)}}}
◊;     }
◊;   }
◊; }

◊; In these sentences, the interpretation of the reflexive is not a constant that can be combined with the meaning of the surrounding elements. Rather, a reflexive object must be interpreted as identical to the meaning of verb’s subject. Of course, a network could learn a context-sensitive interpretation of a reflexive, so that for any sentence with Mary as its subject, the reflexive is interpreted as mary, and with Alice as its subject it is interpreted as alice. However, such piecemeal learning of reflexive meaning will not support generalization to sentences involving a subject that has not been encountered as the antecedent of a reflexive during training, even if the interpretation of the subject has occurred elsewhere. What is needed instead is an interpretation of the reflexive that is characterized not as a specific (sequence of) output token(s), but rather as an abstract instruction to duplicate the interpretation of the subject. Such an abstraction requires more than the jigsaw puzzle approach to meaning that simpler sentences afford.

◊; ◊aside{
◊;   ◊p{◊strong{Figure 1.}}
◊;   ◊p{This is what we've seen.}
◊; }

◊; Marcus (1998) argues that this kind of abstraction, which he takes to require the use of algebraic variables to assert identity, is beyond the capacity of recurrent neural networks. Marcus’s demonstration involves a simple recurrent network (SRN, Elman 1990) language model that is trained on a corpus of sentences of the following form:

◊; ◊sequence{
◊;   ◊item{
◊;     ◊sequence{
◊;       ◊item{◊p{A rose is a rose.}}
◊;       ◊item{◊p{A mountain is a mountain.}}
◊;     }
◊;   }
◊; }

◊; All sentences in this training set have identical subject and object nouns. Marcus shows, however, that the resulting trained network does not correctly predict the subject noun when tested with a novel preamble ◊em{A book is a ...}. Though intriguing, this demonstration is not entirely convincing: since the noun occurring in the novel preamble, book in our example, did not occur in the training data, there is no way that the network could possibly have known what (one-hot represented) output should correspond to the reflexives for a sentence containing the novel (one-hot represented) subject noun, even if the network did successfully encode an identity relation between subject and object.

◊; Frank et al. (2013) explore a related identity task in the context of SRN interpretation of reflexives. In their experiments, SRNs were trained to map input words to corresponding semantic symbols that are output on the same time step in which a word is presented. For most words in the vocabulary, this is a simple task: the desired output is a constant function of the input (◊em{Mary} corresponds to ◊span[#:style "font-variant:small-caps;"]{mary}, etc.). For reflexives however, the target output depends on the subject that had occurred earlier. Like Marcus’s experiment, Frank et al. tested the network’s ability to interpret a reflexive occurring in a sentence containing a subject that had not occurred as a reflexive’s antecedent during training. However, this subject and its corresponding semantic symbol did occur in other (non-reflexive) contexts in the training data, and therefore was in the realm of possible inputs and outputs for the network. Nonetheless, none of the SRNs that they trained succeeded at this task for even a single test example.

◊; Since those experiments were conducted, substantial advances have been made on recurrent neural network architectures, some of which have been crucial in the success of practical NLP systems.

◊; ◊items{
◊;   ◊item{◊p{Types of recurrent units: More sophisticated recurrent units like LSTMs Graves and Schmidhuber (2005) and GRUs Cho et al. (2014) have been shown to better encode preceding context than SRNs.}}
◊;   ◊item{◊p{Sequence to Sequence architectures: The performance of network models that transduce one string to another, used in machine translation and semantic parsing, has been greatly improved by the use of independent encoder and decoder networks Sutskever et al. (2014).}}
◊;   ◊item{◊p{Attention mechanism: The ability of a network to produce contextually appropriate outputs even in the context of novel vocabulary items has been facilitated by content-sensitive attention mechanisms Bahdanau et al. (2016); ?.}}
◊; }

◊; These innovations open up the possibility that modern network architectures may well be able to solve the variable identity problem necessary for mapping reflexive sentences to their logical form. In the experiments we describe below, we explore whether this is the case.

◊; ◊section{Experimental Setup}

◊; Our experiments take the form of a semantic parsing task, where sequences of words are mapped into logical form representations of meaning. Following ?, we do this by means of a sequence to sequence architecture Sutskever et al. (2014) in which the input sentence is fully processed by the encoder network before it is decoded into a sequence of symbols in the target domain (cf. Botvinick and Plaut 2006, Frank and Mathis 2007 for related work). This approach removes the need to synchronize the production of output symbols with the input words, as in Frank et al. (2013), allowing greater flexibility in the nature of semantic representations.

◊; The sequence to sequence architecture is agnostic to the types of recurrent units for the encoding and decoding phases of the computation, and to whether the decoder makes use of an attention mechanism. Here, we explore the effects of using different types of recurrent units and including attention or not. Specifically, we examine the performance and training characteristics of sequence to sequence models based on SRNs, GRUs, and LSTMs with and without multiplicative attention ?.

◊; In all experiments, we perform 5 runs with different random seeds for each model architecture (one layer of SRN, LSTM or GRU units for both the encoder and decoder) and multiplicative attention (with or without) combination. All models used hidden and embedding of size of 256. Training was done using Stochastic Gradient Descent with learning rate of 0.01. Models were trained for a maximum of 100 epochs with early stopping when validation loss fails to decrease by 0.005 over three successive epochs.

◊; We conduct all of our experiments with synthetic datasets that we generate using a simple context-free grammar corresponding to a simple fragment of English. This fragment includes simple sentences with transitive and intran- sitive verbs. Subjects are always proper names and objects are either proper names or a reflexive whose gender matches that of the subject. Our vocabulary includes 8 intransitive verbs, 7 transitive verbs, 15 female names, and 11 male names. The grammar thus generates 5,122 distinct sentences. All sentences are generated with equal probability, subject to the restrictions imposed by each experiment. We use a unification extension to CFG to associate each sentence with a predicate calculus interpretation. The symbols corresponding to the predicates and the entities in our logical language are identical with the verbs and names used by our grammar, yielding representations like those shown in (1) and (2). The output sequences corresponding to the target semantic interpretations include parentheses and commas as separate symbols.

◊; Each of our experiments defines a set of sentences that are withheld during training. The remaining sentences are randomly split 80%–10%–10% between training, validation, and testing sets. Accuracy for each set is computed on a sentence-level basis, i.e., an accurate output requires that all symbols generated by the model be identical to the target.

◊; As discussed in the previous section, we are interested in whether sequence to sequence models can successfully ◊em{generalize} their knowledge of the interpretation of sentences containing reflexives to ones having novel antecedents. To do this, we employ a ◊em{poverty of the stimulus} paradigm in which we remove certain classes of examples from the training data set and test the effect on the network’s success in interpreting reflexive-containing sentences. Our experiments focus on two sorts of restrictions on the training data: (1) varying the number of lexical items that do and do not occur as the antecedents of reflexives in the training set, and (2) varying the syntactic positions in which the non-antecedent names occur. As we will see, both of these restrictions have substantial impacts on the success of our reflexive generalization in ways that vary across network types.

◊; ◊section{Experiment 1: Can Alice know herself?}

◊; In the first experiment, we test to see whether or not networks can generalize knowledge of how to interpret ◊em{herself} to a new antecedent. We withold all examples whose input sequence includes the reflexive ◊em{herself} bound by the antecedent ◊em{Alice} as shown below in (4).

◊; ◊sequence{
◊;   ◊item{Alice verbs herself → ◊span[#:style "font-variant:small-caps;"]{verb(alice,alice)}}
◊; }

◊; Sentences of any other form are included in the training set, including those where Alice appears without binding a reflexive.

◊; ◊subsection{Results}

◊; All network architectures were successful in this task, generalizing the interpretation of ◊em{herself} to the novel antecedent ◊em{Alice}. Even the simplest networks, SRN models without attention, achieve 100% accuracy on the generalization set (those sentences of the form shown in (4)). This is in sharp contrast the negative results obtained by Frank et al. (2013), suggesting an advantage for training with a language with more names as well as for conceptualizing the semantic parsing task in a sequence to sequence, as opposed to language modeling, context.

◊; ◊section{Experiment 2: Doesn’t Alice know Alice?}

◊; While the networks in Experiment 1 are not trained on sentences of the form shown in (4), they are trained on sentences that have the same semantic form, namely sentences in which ◊em{Alice} occur as both subject and object of a transitive verb.

◊; ◊sequence{
◊;   ◊item{Alice verbs Alice → ◊span[#:style "font-variant:small-caps;"]{verb(alice,alice)}}
◊; }

◊; In Experiment 2 we consider whether the presence of such semantically reflexive forms in the training data is helpful to networks in generalizing to syntactically reflexive sentences. We do this by further excluding sentences of the form in (5) from the training data.

◊; ◊subsection{Results}

◊; All architectures except SRNs without attention generalize perfectly to the held out items. Inattentive SRNs also generalize quite well, though only at a mean accuracy of 86%. While success at Experiment 1 demonstrates the networks’ abilities to generalize to novel input contexts, success at Experiment 2 highlights how models can likewise generalize to produce entirely new outputs.

◊; ◊section{Experiment 3: Who’s Alice and who’s Claire?}

◊; ◊aside{
◊;   ◊p{
◊;     Since ◊em{himself} and ◊em{herself} are different lexical items, it is unclear if the network will learn their interpretations together, and whether sentences containing ◊em{himself} will provide support for the interpretation of sentences containing ◊em{herself}. We therefore withhold only sentences of this form with names of a single gender. We have also experimented with witholding masculine reflexive antecedents from the training data, but the main effect remains the number of female antecedents that is withheld.
◊;   }
◊; }

◊; So far, we have considered generalization of reflexive interpretation to a single new name. One possibility is that the network might simply default to the ◊span[#:style "font-variant:small-caps;"]{alice} interpretation when confronted with a new antecedent, as an elsewhere interpretation (but see Gandhi and Lake 2019 for reasons for skepticism). Alternatively, even if the network has acquired a generalized interpretation for reflexives, it may be possible that this happens only when the training data includes overwhelming lexical support (in Experiments 1 and 2, 25 out of the 26 names in our domain appeared in the training data as the antecedent of a reflexive). To explore the contexts under which networks can truly generalize to a range of new antecedents, we construct training datasets in which we progressively withhold more and more names of the forms shown in (6), i.e., those that were removed in Experiment 2.

◊; ◊sequence{
◊;   ◊item{
◊;     ◊sequence{
◊;       ◊item{◊p{◊em{P} verbs herself → ◊span[#:style "font-variant: small-caps;"]{verb(◊em{P},◊em{P})}}}
◊;       ◊item{◊p{◊em{P} verbs ◊em{P} → ◊span[#:style "font-variant: small-caps;"]{verb(◊em{P},◊em{P})}}}
◊;     }
◊;   }
◊; }

◊; ◊span[#:style "text-align: right; width: 100%; font-variant: small-caps; display: block; margin-top: 36px;"]{◊string->symbol{mdash} Jackson Petty}

◊; Paragraphs are important.

◊; #############################################################################

◊; ◊define-citation[1]{
◊;   Dzmitry Bahdanau, Kyunghyun Cho, and Yoshua Bengio. 2016. ◊outlink["http://arxiv.org/abs/1409.0473"]{Neural machine translation by jointly learning to align and translate.}
◊; }
◊; ◊define-citation[2]{
◊;   Matthew M. Botvinick and David C. Plaut. 2006. Short-term memory for serial order: A recurrent neural network model. ◊em{Psychological Review}, 113:201–233.
◊; }
◊; ◊define-citation[3]{
◊;   Kyunghyun Cho, Bart Van Merriënboer, Caglar Gulcehre, Dzmitry Bahdanau, Fethi Bougares, Holger Schwenk, and Yoshua Bengio. 2014. Learning phrase representations using RNN encoder-decoder for statistical machine translation. ◊em{arXiv preprint arXiv:1406.1078}.
◊; }
◊; ◊define-citation[4]{
◊;   Li Dong and Mirella Lapata. 2016. ◊outlink["https://doi.org/10.18653/v1/P16-1004"]{Language to logical form with neural attention.} In ◊em{Proceedings of the 54th Annual Meeting of the Association for Computational Linguistics (Volume 1: Long Papers)}, pages 33–43, Berlin, Germany. Association for Computational Linguistics.
◊; }
◊; ◊define-citation[5]{
◊;   Jeffrey L Elman. 1990. Finding structure in time. ◊em{Cognitive science}, 14(2):179–211.
◊; }
◊; ◊define-citation[6]{
◊;   Jerry A. Fodor and Zenon W. Pylyshyn. 1988. Connectionism and cognitive architecture: A critical analysis. ◊em{Cognition}, 28:3–71.
◊; }
◊; ◊define-citation[7]{
◊;   Robert Frank and Donald Mathis. 2007. Transformational networks. In ◊em{Proceedings of the 3rd Workshop on Psychocomputational Models of Human Language Acquisition}.
◊; }
◊; ◊define-citation[8]{
◊;   Robert Frank, Donald Mathis, and William Badecker. 2013. The acquisition of anaphora by simple recurrent networks. ◊em{Language Acquisition}, 20:181–227.
◊; }
◊; ◊define-citation[4]{Ilya Sutskever, Oriol Vinyals, and Quoc V Le. 2014. Sequence to sequence learning with neural networks. In ◊em{Advances in neural information processing systems}, pages 3104–3112.}