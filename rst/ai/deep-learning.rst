Deep Learning
=============

Classification
--------------

How to evaluate a binary classification problem
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

One possible measure to evaluate binary classification models is **Accuracy** :eq:`classification_accuracy`, i.e.,
*the fraction of predictions we got right*:

.. math::
    :label: classification_accuracy

    Accuracy = \frac{TP+TN}{TP+TN+FP+FN}


.. the below method is used to force line breaks. usage is ``|br|``,
    src: https://salishsea-meopar-docs.readthedocs.io/en/latest/work_env/sphinx_docs.html#forcing-line-breaks

.. |br| raw:: html

    <br>

in which |br|
:math:`TP`: True Position, which is an outcome where *the model correctly predicts the positive class*. |br|
:math:`TN`: True Negative, which is an outcome where *the model correctly predicts the negative class*. |br|
:math:`FP`: False Position, which is an outcome where *the model incorrectly predicts the positive class*. |br|
:math:`FN`: False Negative, which is an outcome where *the model incorrectly predicts the negative class*. |br|

However, in many cases, accuracy is a poor or misleading metric:

* Most often when different kinds of mistakes have different costs;
* Typical case includes class imbalance, when positives or negatives are extremely rare.

For class-imbalanced problems, it is useful to separate out different kinds of errors,
such as **Precision**:eq:`classification_precision` and **Recall**:eq:`classification_recall`:

.. math::
    :label: classification_precision

    Precision = \frac{TP}{TP+FP}


.. math::
    :label: classification_recall

    Recall = \frac{TP}{TP+FN}

Precision answers the question of **what proportion of positive identifications was actually correct**. |br|
Recall answers the question of **what proportion of actual positives was identified correctly**.

If model A has better precision and better recall than model B, then model A is probably better.

**F1 score** (also **F-score** or **F-measure**) :eq:`f1-measure` is the `harmonic average <https://en.wikipedia.org/wiki/Harmonic_mean>`_ [#]_ of precision and recall.

.. math::
    :label: f1-measure

    F_1=\Bigg(\frac{precision^{-1}+recall^{-1}}{2} \Bigg)^{-1}=\frac{2 \cdot precision \cdot recall}{precision+recall}

The importance of the F1 score is different based on the scenario. Lets assume the target variable is a binary label.

#. Balanced class: In this situation, the F1 score can effectively be ignored, the mis-classification rate is key.
#. Unbalanced class, but both classes are important: If the class distribution is highly skewed (such as 80:20 or 90:10), then a classifier can get a low mis-classification rate simply by choosing the majority class. In such a situation, I would choose the classifier that gets high F1 scores on both classes, as well as low mis-classification rate. A classifier that gets low F1-scores should be overlooked.
#. Unbalanced class, but one class if more important that the other. E.g., in Fraud detection, it is more important to correctly label an instance as fraudulent, as opposed to labeling the non-fraudulent one. In this case, I would pick the classifier that has a good F1 score only on the important class. Recall that the F1-score is available per class.

.. [#] The `harmonic average <https://en.wikipedia.org/wiki/Harmonic_mean>`_ can be expressed as the reciprocal of the arithmetic mean of the reciprocals of the given set of observations.