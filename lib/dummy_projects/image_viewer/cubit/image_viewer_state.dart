part of 'image_viewer_cubit.dart';

@immutable
abstract class ImageViewerState {}

final class ImageViewerInitial extends ImageViewerState {}

final class ImageViewerImageChangedState extends ImageViewerState {}

final class ImageViewerNavChangedState extends ImageViewerState {}
