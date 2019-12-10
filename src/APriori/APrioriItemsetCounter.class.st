Class {
	#name : #APrioriItemsetCounter,
	#superclass : #Object,
	#instVars : [
		'transactions'
	],
	#category : #APriori
}

{ #category : #'as yet unclassified' }
APrioriItemsetCounter class >> forTransactions: aTransactionsDatabase [
	^ self new initializeTransactions: aTransactionsDatabase
]

{ #category : #'lazy counting' }
APrioriItemsetCounter >> countOfItemset: anItemset [
	| count |
	count := 0.
	
	transactions do: [ :transaction |
		(anItemset isSubsetOf: transaction)
			ifTrue: [ count := count + 1 ] ].
		
	^ count
]

{ #category : #initialization }
APrioriItemsetCounter >> initializeTransactions: aTransactionsDatabase [
	transactions := aTransactionsDatabase 
]