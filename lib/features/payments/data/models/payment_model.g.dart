// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentModelImpl _$$PaymentModelImplFromJson(Map<String, dynamic> json) =>
    _$PaymentModelImpl(
      id: (json['id'] as num).toInt(),
      playerId: (json['player_id'] as num).toInt(),
      playerName: json['player_name'] as String,
      clubId: (json['club_id'] as num).toInt(),
      clubName: json['club_name'] as String,
      leagueId: (json['league_id'] as num?)?.toInt(),
      leagueName: json['league_name'] as String?,
      type: json['type'] as String,
      status: json['status'] as String,
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String,
      dueDate: json['due_date'] as String,
      verifiedAt: json['verified_at'] as String?,
      verifiedBy: (json['verified_by'] as num?)?.toInt(),
      verifierName: json['verifier_name'] as String?,
      rejectionNotes: json['rejection_notes'] as String?,
      paymentProofUrl: json['payment_proof_url'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$PaymentModelImplToJson(_$PaymentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'player_id': instance.playerId,
      'player_name': instance.playerName,
      'club_id': instance.clubId,
      'club_name': instance.clubName,
      'league_id': instance.leagueId,
      'league_name': instance.leagueName,
      'type': instance.type,
      'status': instance.status,
      'amount': instance.amount,
      'description': instance.description,
      'due_date': instance.dueDate,
      'verified_at': instance.verifiedAt,
      'verified_by': instance.verifiedBy,
      'verifier_name': instance.verifierName,
      'rejection_notes': instance.rejectionNotes,
      'payment_proof_url': instance.paymentProofUrl,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$PaymentListResponseImpl _$$PaymentListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentListResponseImpl(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => PaymentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$PaymentListResponseImplToJson(
        _$PaymentListResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'meta': instance.meta,
      'message': instance.message,
    };

_$PaymentResponseImpl _$$PaymentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentResponseImpl(
      success: json['success'] as bool,
      data: PaymentModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$PaymentResponseImplToJson(
        _$PaymentResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

_$PaginationMetaImpl _$$PaginationMetaImplFromJson(Map<String, dynamic> json) =>
    _$PaginationMetaImpl(
      currentPage: (json['current_page'] as num).toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      from: (json['from'] as num?)?.toInt(),
      to: (json['to'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PaginationMetaImplToJson(
        _$PaginationMetaImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
      'from': instance.from,
      'to': instance.to,
    };

_$UploadProofResponseImpl _$$UploadProofResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadProofResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      paymentProofUrl: json['payment_proof_url'] as String?,
    );

Map<String, dynamic> _$$UploadProofResponseImplToJson(
        _$UploadProofResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'payment_proof_url': instance.paymentProofUrl,
    };

_$VerifyPaymentRequestImpl _$$VerifyPaymentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyPaymentRequestImpl(
      action: json['action'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$VerifyPaymentRequestImplToJson(
        _$VerifyPaymentRequestImpl instance) =>
    <String, dynamic>{
      'action': instance.action,
      'notes': instance.notes,
    };

_$VerifyPaymentResponseImpl _$$VerifyPaymentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyPaymentResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : PaymentModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VerifyPaymentResponseImplToJson(
        _$VerifyPaymentResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$ClubPaymentStatisticsImpl _$$ClubPaymentStatisticsImplFromJson(
        Map<String, dynamic> json) =>
    _$ClubPaymentStatisticsImpl(
      success: json['success'] as bool,
      data: ClubPaymentStatsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ClubPaymentStatisticsImplToJson(
        _$ClubPaymentStatisticsImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$ClubPaymentStatsDataImpl _$$ClubPaymentStatsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ClubPaymentStatsDataImpl(
      totalPending: (json['total_pending'] as num).toInt(),
      totalUnderVerification: (json['total_under_verification'] as num).toInt(),
      totalVerified: (json['total_verified'] as num).toInt(),
      totalOverdue: (json['total_overdue'] as num).toInt(),
      pendingAmount: (json['pending_amount'] as num).toDouble(),
      verifiedAmount: (json['verified_amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$ClubPaymentStatsDataImplToJson(
        _$ClubPaymentStatsDataImpl instance) =>
    <String, dynamic>{
      'total_pending': instance.totalPending,
      'total_under_verification': instance.totalUnderVerification,
      'total_verified': instance.totalVerified,
      'total_overdue': instance.totalOverdue,
      'pending_amount': instance.pendingAmount,
      'verified_amount': instance.verifiedAmount,
    };
