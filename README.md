# flupro

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

```
flupro
├─ .git
├─ .gitignore
├─ .metadata
├─ analysis_options.yaml
├─ android
├─ ios
├─ assets
│  └─ images
├─ lib
│  ├─ app.dart
│  ├─ base
│  │  ├─ action_state.dart
│  │  ├─ action_state.freezed.dart
│  │  ├─ extensions
│  │  │  ├─ async_value.dart
│  │  │  ├─ auto_dispose_ref.dart
│  │  │  ├─ build_context_extension.dart
│  │  │  ├─ color_extension.dart
│  │  │  ├─ custom_scroll_extension.dart
│  │  │  ├─ json_extension.dart
│  │  │  ├─ string_extension.dart
│  │  │  └─ widget_ref.dart
│  │  ├─ refresh
│  │  │  ├─ paged_control.dart
│  │  │  ├─ paging_mixin.dart
│  │  │  ├─ pull_refresh_control.dart
│  │  │  ├─ refresh.dart
│  │  │  └─ refresh_header.dart
│  │  ├─ utils
│  │  │  ├─ cache_manager.dart
│  │  │  ├─ cache_manager.g.dart
│  │  │  ├─ data_utils.dart
│  │  │  ├─ error.dart
│  │  │  ├─ file_utils.dart
│  │  │  ├─ format_utils.dart
│  │  │  └─ share_utils.dart
│  │  └─ widgets
│  │     ├─ app_bar.dart
│  │     ├─ app_bar_back_button.dart
│  │     ├─ app_progress_indicator.dart
│  │     ├─ countdown_button.dart
│  │     ├─ data_scaffold.dart
│  │     ├─ debug_dialog.dart
│  │     ├─ empty_data_view.dart
│  │     ├─ highlighted_button.dart
│  │     ├─ network_image_view.dart
│  │     ├─ photo_browse_view.dart
│  │     ├─ primary_button.dart
│  │     ├─ selectable_item_notifier.dart
│  │     ├─ share_option_dialog.dart
│  │     └─ toast.dart
│  ├─ config.dart
│  ├─ config.g.dart
│  ├─ events
│  │  └─ events.dart
│  ├─ generated
│  │  ├─ intl
│  │  │  ├─ messages_all.dart
│  │  │  ├─ messages_en.dart
│  │  │  └─ messages_zh.dart
│  │  └─ l10n.dart
│  ├─ l10n
│  │  ├─ intl_en.arb
│  │  └─ intl_zh.arb
│  ├─ main.dart
│  ├─ models
│  │  ├─ app_token.dart
│  │  ├─ app_token.freezed.dart
│  │  └─ app_token.g.dart
│  ├─ models.dart
│  ├─ network
│  │  ├─ api_client.dart
│  │  ├─ api_client.g.dart
│  │  ├─ data_interceptor.dart
│  │  ├─ params
│  │  └─ params.dart
│  ├─ pages
│  ├─ providers
│  │  ├─ auth_provider.dart
│  │  ├─ auth_provider.g.dart
│  │  └─ event_provider.dart
│  ├─ providers.dart
│  ├─ router.dart
│  └─ support_files
│     ├─ assets.gen.dart
│     └─ theme.dart
├─ pubspec.lock
├─ pubspec.yaml
├─ README.md
└─ test
   └─ widget_test.dart

```